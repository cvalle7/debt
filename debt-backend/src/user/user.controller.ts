import { Body, Controller, Get, Post } from '@nestjs/common';
import { UserService } from './user.service';
import { User } from './user.entity';
import { DebtService } from 'src/debt/debt.service';

@Controller('/api/user')
export class UserController {

    constructor(private readonly userService: UserService, private readonly debtService: DebtService){}

    @Get()
    async getUsers() {
        return this.userService.getUsers();
    }

    @Post()
    async createUser(@Body() input: {user: User, debt_id: number}){
        try{
            const {user, debt_id} = input;
            const parent_debt = await this.debtService.getDebt(debt_id);
            user.debt = parent_debt;
            return await this.userService.createUsers(user);
        }catch(err){
            throw new Error(err.message);
        }
    }
}
