import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserModule } from './user/user.module';
import { User } from './user/user.entity';
import { DebtModule } from './debt/debt.module';
import { Debt } from './debt/debt.entity';
import { PayModule } from './pay/pay.module';
import { PayForModule } from './pay_for/pay_for.module';
import { Pay } from './pay/pay.entity';
import { PayFor } from './pay_for/pay_for.entity';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env'
    }),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.BD_HOST,
      port: parseInt(process.env.BD_PORT),
      username: process.env.BD_USERNAME,
      password: process.env.BD_PASSWORD,
      database: process.env.BD_DATABASE,
      entities: [User, Debt, Pay, PayFor],
      synchronize: true
    }),
    UserModule,
    DebtModule,
    PayModule,
    PayForModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule { }
