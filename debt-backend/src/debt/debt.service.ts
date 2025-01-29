import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Debt } from './debt.entity';
import { Repository } from 'typeorm';
import { User } from 'src/user/user.entity';
import { UserService } from 'src/user/user.service';

@Injectable()
export class DebtService {

    constructor(
        @InjectRepository(Debt)
        private debtRepository: Repository<Debt>,
        private readonly userService: UserService
    ) { }

    async getDebt(debt_id) {
        try {
            const debt = await this.debtRepository.find({
                where: { id: debt_id }, relations: {
                    users: {
                        pay: true,
                        pay_for: {
                            users: true,
                            pays: true
                        }
                    }
                }
            });
            if (debt) {
                return this.orderResults(debt[0]);
            }
        } catch (err) {
            throw new Error(err.message);
        }
    }

    async getDebts() {
        try {
            const results = await this.debtRepository.find({
                relations: {
                    users: {
                        pay: true,
                        pay_for: {
                            users: true,
                            pays: true
                        }
                    }
                }
            });
            let res = [];
            for (let r of results) {
                res.push(this.orderResults(r));
            }
            return res;
        } catch (error) {
            throw new Error(error.message);
        }
    }

    async createDebt(debt: Debt, users: User[]) {
        const newDebt = await this.debtRepository.save(debt);
        const newUsers = [];
        for (let u of users) {
            u.debt = newDebt;
            const newUser = await this.userService.createUsers(u);
            newUsers.push(newUser);
        }
        return await this.debtRepository.find({
            where: { id: newDebt.id },
            relations: { users: true }
        });
    }

    async updateDebt(debt: Debt) {
        try {
            const d = await this.debtRepository.find({where: {id: debt.id}});
            if(d[0]){
                d[0].money = debt.money;
                delete d[0].id;
                return await this.debtRepository.update({ id: debt.id }, d[0]);
            }
        } catch (error) {
            throw new Error(error.message);
        }
    }

    private orderResults(debt) {
        let result = {
            id: debt.id,
            name: debt.name,
            money: debt.money,
            created_at: debt.created_at,
            users: [],
            pays: [],
        }

        let users = [];
        let pays = [];
        let payFor = [];
        for (let user of debt.users) {
            let u = {
                id: user.id,
                name: user.name,
                created_at: user.created_at
            }
            users.push(u);

            for (let p of user.pay) {
                pays.push(p);
            }

            for (let p of user.pay_for) {
                payFor.push(p);
            }

        }

        for (let p of pays) {
            const findPays = payFor.filter(pf => pf.pay_id == p.id);
            if (findPays.length > 0) {
                p.pay_for = findPays
            }
        }

        result.users = users;
        result.pays = pays;
        return result;
    }
}
