import { Controller, Get, Post, Body, Param, Put, Req, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { User } from './entities/user.entities';
import { AuthGuard } from '@nestjs/passport';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) { }

  // Get Danh sách người dùng
  @Get("/get-list-user")
  getListUser() {
    return this.userService.getListUser()
  }

  @Post("/sign-up")
  signUp(@Body() body) {
    return this.userService.signUp(body)
  }

  @Post("/sign-in")
  signIn(@Body() body) {
    return this.userService.signIn(body)
  }

  @Get('/get-user/:id')
  getUserById(@Param("id") id: string) {
    return this.userService.getUserById(Number(id))
  }

  @UseGuards(AuthGuard("jwt"))
  @Put('/update-user')
  updateUser(@Body() body, @Req() req) {
    let tokenDecode = req.user
    let { nguoi_dung_id } = tokenDecode.data
    return this.userService.updateUser(body, nguoi_dung_id)
  }

  @UseGuards(AuthGuard("jwt"))
  @Put('/update-pass')
  updatePass(@Body() body, @Req() req) {
    let tokenDecode = req.user
    let { nguoi_dung_id } = tokenDecode.data
    return this.userService.updatePass(body, nguoi_dung_id)
  }
};


