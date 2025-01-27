import { Module } from '@nestjs/common';
import { PayController } from './pay.controller';
import { PayService } from './pay.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Pay } from './pay.entity';
import { UserModule } from 'src/user/user.module';
import { PayForModule } from 'src/pay_for/pay_for.module';
import { DebtModule } from 'src/debt/debt.module';

@Module({
  imports: [TypeOrmModule.forFeature([Pay]), UserModule, PayForModule, DebtModule],
  controllers: [PayController],
  providers: [PayService]
}) 
export class PayModule {}
