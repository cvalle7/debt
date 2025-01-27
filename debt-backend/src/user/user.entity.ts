import { Debt } from "src/debt/debt.entity";
import { Pay } from "src/pay/pay.entity";
import { PayFor } from "src/pay_for/pay_for.entity";
import { Column, Entity, ManyToOne, OneToMany, PrimaryGeneratedColumn } from "typeorm";

@Entity('users')
export class User{

    @PrimaryGeneratedColumn()
    id: number

    @Column({nullable: false})
    name: string

    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP'})
    created_at: Date

    @OneToMany(() => Pay, (pay) => pay.pay_by)
    pay: Pay[]

    @OneToMany(() => PayFor, (pay_for) => pay_for.users)
    pay_for: PayFor[]

    @ManyToOne(() => Debt, (debt) => debt.users, {onDelete: 'CASCADE'})
    debt: Debt
}