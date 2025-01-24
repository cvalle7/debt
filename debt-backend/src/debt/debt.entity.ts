import { User } from "src/user/user.entity";
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

    @OneToMany(() => User, (user) => user.debt)
    users: User[]
}