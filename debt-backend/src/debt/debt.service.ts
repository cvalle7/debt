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

    async createDebt(debt: Debt, users: User[]) {
        const newDebt = await this.debtRepository.save(debt);
        const newUsers = [];
        for (let u of users) {
            u.debt = newDebt;
            const newUser = await this.userService.createUsers(u);
            newUsers.push(newUser);
        }
        return await this.debtRepository.find({
            where: {id: newDebt.id},
            relations:{users: true}
        });
    }
}
