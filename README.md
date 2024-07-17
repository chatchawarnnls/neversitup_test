-lib 

--models    #ปั้นmodel from josn 

    -department     #folder department

        -department_list_result.dart    #file model department list

        -department_product_list_result.dart    #file model department product list
    -http_error.dart    #file model http error 
--repositories #จัดการdata from api
    -department     #folder จัดการdata department
        -department_mockup.dart     #ไว้สำหรับmockup json data
        -department_provider.dart     #call api
        -department_repositories.dart     #convert response to model
    -http   #folder http
        -http_error_mockup.dart  #ไว้สำหรับmockup json data ในกรณีนี้ไว้mocukup เวลาที่ไม่มีjson เวลา call api error
--screens   #วาดui screen ต่างๆ
    -department     #folder screen ของ department
        -department_carousel.dart   # ui ของ department carousel
        -department_product_list.dart   # ui ของ department product list
        -department.dart    # ui หน้าจอหลัก ของ department
--utilities     #Coreservice และ Configs ต่างๆภายในโปรเจ็ค
    -configs    #config ต่างๆภายในโปรเจ็ค
        -appconfigs.dart    #file สำหรับสร้างclass และตัวแปลGlobalต่างๆ
--widget        #widget กลางที่มีการนำไปใช้บ่อยๆภายในโปรเจ็ค
    -loading.dart       #widget loading
--main.dart     #ไฟล์หลักในการรันโปรเจ็ค
