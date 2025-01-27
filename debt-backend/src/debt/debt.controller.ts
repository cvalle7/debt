import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { DebtService } from './debt.service';
import { Debt } from './debt.entity';
import { User } from 'src/user/user.entity';

@Controller('/api/debt')
export class DebtController {

    constructor(private readonly debtService: DebtService) { }

    @Get()
    async getDebt(@Param('id') id: number){
        try {
            return await this.debtService.getDebt(id);
        } catch (error) {
            throw new Error(error.message);
        }
    }

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
