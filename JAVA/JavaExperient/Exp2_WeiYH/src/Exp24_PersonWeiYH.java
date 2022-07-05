public class Exp24_PersonWeiYH {
    String name;
    int age;
    String gender;
    Exp24_PersonWeiYH partner;
    public  Exp24_PersonWeiYH marry(Exp24_PersonWeiYH partner){
        if(this.partner!=null){
            System.out.println("该角色已经有配偶!婚配失败");
            return this.partner;
        }
        else{
            if(this.gender.equals("Male") && partner.gender.equals("Female")){
                if(this.age>=23 && partner.age>=21){
                    System.out.println("恭喜两位婚配成功!");
                    return partner;
                }
                else if(this.age<23 && partner.age>=21) System.out.println("男方年龄不足23岁!婚配失败!");
                else if(partner.age<21 && this.age>=23) System.out.println("女方年龄不足21岁!婚配失败!");
                else System.out.println("男方年龄不足23岁，女方年龄不足21岁,婚配失败!");
                return this.partner;
            }
            else if(this.gender.equals("Female") && partner.gender.equals("Male")) {
                if (this.age >= 21 && partner.age >= 23) {
                    System.out.println("恭喜两位婚配成功!");
                    return partner;
                }
                else if (this.age < 21 && partner.age>=23) System.out.println("女方年龄不足21岁!婚配失败!");
                else if (partner.age < 23 && partner.age>=21) System.out.println("男方年龄不足23岁!婚配失败!");
                else System.out.println("男方年龄不足23岁，女方年龄不足21岁,婚配失败!");
                return this.partner;
            }
            else {
                System.out.println("两名角色性别相同,婚配失败!");
                return this.partner;
            }
        }
    }
}
