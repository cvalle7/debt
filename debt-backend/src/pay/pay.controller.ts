import { Body, Controller, Get, Post } from '@nestjs/common';
import { Pay } from './pay.entity';
import { PayService } from './pay.service';

@Controller('/api/pay')
export class PayController {

    constructor(private readonly payService: PayService) { }

    @Post()
    async createPay(@Body() inputData: { pay: Pay, pay_by: number, pay_for: number[] }) {
        const { pay, pay_by, pay_for } = inputData;
        try {
            return await this.payService.createPay(pay, pay_by, pay_for);
        } catch (err) {
            throw new Error(err.message);
        }
    }
}
