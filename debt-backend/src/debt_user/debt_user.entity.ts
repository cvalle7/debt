import { Debt } from "src/debt/debt.entity";
import { User } from "src/user/user.entity";
import { Entity, ManyToOne, PrimaryColumn } from "typeorm";

@Entity('debts_users')
export class DebtUser{

    @PrimaryColumn()
    debt_id: number

    @PrimaryColumn()
    user_id: number

    @ManyToOne(() => Debt, (debt) => debt.debts_users, {onDelete: 'CASCADE'})
    debt: Debt

    @ManyToOne(() => User, (user) => user.debts_users, {onDelete: "CASCADE"})
    user: User
}