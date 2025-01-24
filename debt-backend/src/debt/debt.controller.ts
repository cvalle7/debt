import { Controller, Get } from '@nestjs/common';
import { DebtService } from './debt.service';

@Controller('debt')
export class DebtController {

    constructor(private readonly debtService: DebtService){}

    @Get()
    async getDebts(){

    }
}
