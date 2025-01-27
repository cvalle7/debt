import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Pay } from './pay.entity';
import { Repository } from 'typeorm';
import { UserService } from 'src/user/user.service';
import { PayForService } from 'src/pay_for/pay_for.service';

@Injectable()
export class PayService {

    constructor(
        @InjectRepository(Pay)
        private payRepository: Repository<Pay>,
        private readonly userService: UserService,
        private readonly payForService: PayForService
    ){}

    async createPay(pay: Pay, pay_by: number, pay_for: number[]){
        try{
            const user = await this.userService.getUserById(pay_by);
            pay.pay_by = user;
            const p = await this.payRepository.save(pay);
            for(let pf of pay_for){
                await this.payForService.createPayFor(pf, p.id);
            }
            return await this.payRepository.find({where: {id: pay.id}, relations: {
                pay_for: true,
                pay_by: true
            }})
        }catch(err){
            throw new Error(err.message)
        }
    }
}
