import { Module } from '@nestjs/common';
import { PayForService } from './pay_for.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PayFor } from './pay_for.entity';

@Module({
  imports: [TypeOrmModule.forFeature([PayFor])],
  providers: [PayForService],
  exports: [PayForService, TypeOrmModule]
})
export class PayForModule {}
