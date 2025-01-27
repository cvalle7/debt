import { Pay } from "src/pay/pay.entity";
import { User } from "src/user/user.entity";
import { Entity, JoinColumn, ManyToOne, PrimaryColumn } from "typeorm";

@Entity('pay_for')
export class PayFor{

    @PrimaryColumn()
    user_id: number

    @PrimaryColumn()
    pay_id: number
    
    @ManyToOne(() => Pay, (pay) => pay.pay_for, {onDelete: "CASCADE"})
    @JoinColumn({name: 'pay_id'})
    pays: Pay

    @ManyToOne(() => User, (user) => user.pay_for, {onDelete: 'CASCADE'})
    @JoinColumn({name: 'user_id'})
    users: User
}