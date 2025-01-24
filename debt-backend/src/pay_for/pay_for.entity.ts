import { Pay } from "src/pay/pay.entity";
import { User } from "src/user/user.entity";
import { Entity, ManyToOne, PrimaryColumn } from "typeorm";

@Entity('pay_for')
export class PayFor{

    @PrimaryColumn()
    user_id: number

    @PrimaryColumn()
    pay_id: number
    
    @ManyToOne(() => Pay, (pay) => pay.pay_for, {onDelete: "CASCADE"})
    pays: Pay

    @ManyToOne(() => User, (user) => user.pay_for, {onDelete: 'CASCADE'})
    users: User
}