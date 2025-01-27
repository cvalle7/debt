import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './user.entity';
import { Repository, useContainer } from 'typeorm';

@Injectable()
export class UserService {

    constructor(
        @InjectRepository(User)
        private userRepository: Repository<User>,
    ) { }


    async getUserById(user_id: number){
        try {
            const user =  await this.userRepository.findBy({id: user_id});
            if(user){
                return user[0];
            }
            throw new Error('user not found');
        } catch (err) {
            throw new Error(err.message);
        }
    }

    async createUsers(user: User): Promise<User> {
        try {
            return await this.userRepository.save(user);
        } catch (err) {
            throw new Error(err.message);
        }
    }

    async getUsers(): Promise<User[]> {
        try {
            return this.userRepository.find();

        } catch (err) {
            throw new Error(err.message);
        }
    }
}
