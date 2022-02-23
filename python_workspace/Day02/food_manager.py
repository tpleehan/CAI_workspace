'''
* 사전을 사용한 음식점 메뉴판 관리 프로그램.
- key: 음식명, value: 음식의 가격
'''
from select import select


foods = {}

while True:

    print("\n\n====== 음식점 메뉴 관리 프로그램 ======")
    print("# 1. 신규 메뉴 등록하기")
    print("# 2. 메뉴판 전체보기")
    print("# 3. 프로그램 종료")
    print("=======================================")
    menu = int(input("# 메뉴 입력: "))

    if menu == 1:
        '''
        1. 메뉴명을 입력받아 해당 메뉴가 사전에 이미 존재한다면 이미 등록된 메뉴라고 출력한다.
        2. 사전에 존재하지 않는 메뉴라면 가격을 입력받아 key:value 쌍으로 맵핑하여 사전에 저장한다.
        '''
        name = input('메뉴명: ')
        if name not in foods:
            price = input('가격: ')
            foods[name] = price
            print(f'신규 메뉴 {name}이(가) 등록되었습니다.')
        else:
            print(f'{name}은(는) 이미 등록된 메뉴입니다.')

    elif menu == 2:
        '''
        - 만약 2번을 선택했는데, 메뉴가 하나도 등록되어 있지 않다면 먼저 등록하라고 메인 메뉴로 돌려보낸다.
        - 사전에 등록된 메뉴명과 가격을 전부 출력한다.
        ex) 짜장면 : 4000원
            탕수육 : 18000원
            짬뽕 : 7000원 ...
        -----------------------------------------

        메뉴판 전체 출력 후 메뉴를 새롭게 입력 받는다.
        ex (1. 수정 | 2. 삭제 | 3. 나가기)
        새로운 메뉴를 입력받아서 수정과 삭제를 진행한다.
        # 수정 -> 가격을 변경할 메뉴의 이름을 먼저 입력받고
        해당 이름이 사전에 존재한다면 수정할 가격을 새롭게 입력받고 수정을 진행한다.
        이름이 없을 경우 "해당 음식은 등록된 음식이 아닙니다."라고 출력한다.
        # 삭제 -> 삭제할 메뉴명을 입력받아서 삭제를 진행.
        이름이 없을 경우 "해당 음식은 등록된 음식이 아닙니다."라고 출력한다.
        # 나가기 -> 메인메뉴로 나가면 됩니다.
        '''
        if len(foods) != 0:
            print('\n========== 메뉴판 ==========')
            for m in foods:
                print(f'{m} : {foods[m]}원')
            print('============================')

            print('1. 수정 | 2. 삭제 | 3. 나가기')
            select = input('> ')

            if select == '1':
                print('가격을 변경할 메뉴를 입력해주세요.')
                name = input('=> ')

                if name in foods:
                    new_price = input('변경할 가격: ')
                    foods[name] = new_price
                    print(f'{name}의 가격이 {new_price}원으로 변경되었습니다.')
                else:
                    print(f'{name}은(는) 등록된 음식이 아닙니다.')

            elif select == '2':
                print('삭제할 음식명을 입력하세요.')
                name = input('=> ')

                if name in foods:
                    del(foods[name])
                    print(f'{name}이(가) 삭제되었습니다.')
                else:
                    print(f'{name}은(는) 등록된 음식이 아닙니다.')

            elif select == '3':
                continue # 나가기 3번은 아예 작성하지 않아도 처음으로 간다.

        else:
            print('등록된 메뉴가 없습니다. 메뉴를 먼저 등록해 주세요.')

    elif menu == 3:
        '''
        ("# 프로그램을 종료하시겠습니까? [Y / N]")
        프로그램 종료 여부를 한번 더 물어 본 후
        만약 y 이외의 값이 들어온다면 종료 의지가 없다고 판단하고 종료를 취소한다.
        '''
        print('# 프로그램을 종료하시겠습니까? [Y / N]')
        quit = input('=> ').lower()
        if quit == 'y':
            print('프로그램을 종료합니다.')
            break
        else:
            print('프로그램을 종료를 취소합니다.')

    else:
        print("메뉴를 잘못 입력하셨습니다.")

    print("\n메뉴를 보시려면 Enter키를 입력하세요...")
    input()