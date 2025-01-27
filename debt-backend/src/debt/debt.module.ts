import { forwardRef, Module } from '@nestjs/common';
import { DebtController } from './debt.controller';
import { DebtService } from './debt.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Debt } from './debt.entity';
import { UserModule } from 'src/user/user.module';

@Module({
  imports: [TypeOrmModule.forFeature([Debt]), forwardRef(() => UserModule)],
  controllers: [DebtController],
  providers: [DebtService],
  exports: [DebtService, TypeOrmModule]
})
export class DebtModule {}
