import { DebtUser } from "src/debt_user/debt_user.entity";
import { Pay } from "src/pay/pay.entity";
import { Column, Entity, OneToMany, PrimaryColumn } from "typeorm";

@Entity('debts')
export class Debt{

    @PrimaryColumn()
    id: number

    @Column({nullable: false})
    name: string

    @Column()
    money: number

    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP'})
    created_at: Date

    @OneToMany(() => Pay, (pay) => pay.debt)
    pays: Pay[]

    @OneToMany(() => DebtUser, (debts_users) => debts_users.debt)
    debts_users: DebtUser[]
}