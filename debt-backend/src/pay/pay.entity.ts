import { Debt } from "src/debt/debt.entity";
import { PayFor } from "src/pay_for/pay_for.entity";
import { User } from "src/user/user.entity";
import { Column, Entity, ManyToOne, OneToMany, PrimaryColumn } from "typeorm";

@Entity('pays')
export class Pay{

    @PrimaryColumn()
    id: number

    @Column({nullable: false})
    name: string

    @Column({nullable: false})
    amount: number

    @ManyToOne(() => User, (user) => user.pay, {onDelete: 'CASCADE'})
    pay_by: User

    @Column({type: 'timestamp', default: () => 'CURRENT_TIMESTAMP'})
    created_at: Date

    @OneToMany(() => PayFor, (pay_for) => pay_for.pays)
    pay_for: PayFor[]
}