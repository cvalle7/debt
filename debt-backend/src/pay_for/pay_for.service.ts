import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PayFor } from './pay_for.entity';
import { Repository } from 'typeorm';

@Injectable()
export class PayForService {

    constructor(
        @InjectRepository(PayFor)
        private payForRepo: Repository<PayFor>
    ){}

    async createPayFor(user_id: number, pay_id: number){
        try{
            return await this.payForRepo.save({user_id: user_id, pay_id: pay_id});
        }catch(err){
            throw new Error(err.message);
        }
    }
}
