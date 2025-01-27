import { Body, Controller, Get, Post } from '@nestjs/common';
import { DebtService } from './debt.service';
import { Debt } from './debt.entity';
import { User } from 'src/user/user.entity';

@Controller('/api/debt')
export class DebtController {

    constructor(private readonly debtService: DebtService) { }

    @Post()
    async createDebt(@Body() inputData: { debt: Debt, users: User[] }) {
        try {
            const { debt, users } = inputData
            return await this.debtService.createDebt(debt, users);
        } catch (err) {
            console.log(err.message)
            throw new Error(err.message)
        }
    }
}
