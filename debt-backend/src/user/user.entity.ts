import { DebtUser } from "src/debt_user/debt_user.entity";
import { Pay } from "src/pay/pay.entity";
import { PayFor } from "src/pay_for/pay_for.entity";
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm";

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

    @OneToMany(() => DebtUser, (debts_users) => debts_users.user)
    debts_users: DebtUser[]
}