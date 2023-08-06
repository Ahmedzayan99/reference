
/*1111111111111111111111111111111*/
/*
///Toggle Screen
final PageStorageBucket bucket = PageStorageBucket();
int initialActive = 0;
Widget isActiveScreen =  CompletedTripsScreen();
List<Widget> Screens=[
  const CompletedTripsScreen(),
  const CancelledTripsScreen(),
];
void changeActiveButton(int index) {
  initialActive = index;
  isActiveScreen=Screens[index];
  emit(ChangeBottomActive());




  class CustomAppBarTrips extends StatelessWidget {
  const CustomAppBarTrips({
    super.key,
    required this.title,
    required this.titleButton1,
    required this.titleButton2,
    required this.isActive,
    required this.onTap1,
    required this.onTap2,
  });

  final String title;
  final String titleButton1;
  final String titleButton2;
  final int isActive;
  final void Function() onTap1;
  final void Function() onTap2;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      type: MaterialType.card,
      color: AppColors.colorWhite,
      child: Container(
        height: 140.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45.w,
                  height: 45.h,
                  color: Colors.transparent,
                ),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 20.sp, color: AppColors.colorBlack),
                ),
                Container(
                  width: 45.w,
                  height: 45.h,
                  color: Colors.transparent,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: onTap1,
                    elevation: 0,
                    hoverElevation: 0,
                    highlightElevation: 0,
                    focusElevation: 0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    height: 60.h,
                    color: AppColors.colorWhite,
                    shape: LinearBorder.bottom(
                        side: BorderSide(
                      color: AppColors.colorDarkGreen,
                      width: isActive == 0 ? 3.0 : 0,
                    )),
                    child: Text(
                      titleButton1,
                      style: TextStyle(
                          color: AppColors.colorBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: onTap2,
                    elevation: 0,
                    hoverElevation: 0,
                    highlightElevation: 0,
                    focusElevation: 0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    height: 60.h,
                    color: AppColors.colorWhite,
                    shape: LinearBorder.bottom(
                        side: BorderSide(
                            color: AppColors.colorDarkGreen,
                            width: isActive == 1 ? 3.0 : 0)),
                    child: Text(
                      titleButton2,
                      style: TextStyle(
                          color: AppColors.colorBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

}*/

/*
222222222222222222222222222222222222222222222222

class CustomAppBarRideRequest extends StatelessWidget {
  const CustomAppBarRideRequest({
    super.key,
    required this.title,
    // required this.title,
    required this.titleButton1,
    required this.titleButton2,
    required this.isActive,
    required this.onTap1,
    required this.onTap2,
  });

  final String title;

  // final String title;
  final String titleButton1;
  final String titleButton2;
  final int isActive;
  final void Function() onTap1;
  final void Function() onTap2;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      type: MaterialType.card,
      color: AppColors.colorWhite,
      child: Container(
        height: 140.h,
        width: double.infinity,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackIcon(
              onTap: () {
                navigateFinish(context, HomePageLayoutScreen());
              },
            ),
            SizedBox(
              width: 35.w,
            ),
            Expanded(
              child: MaterialButton(
                onPressed: onTap1,
                elevation: 10,
                hoverElevation: 0,
                highlightElevation: 0,
                focusElevation: 0,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                height: 40.h,
                color: isActive == 0
                    ? AppColors.colorDarkGreen
                    : AppColors.colorPickUp,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.horizontal(
                    left: TranslateCubit.get(context).isArabic
                        ? Radius.zero
                        : Radius.circular(20.r),
                    right: TranslateCubit.get(context).isArabic
                        ? Radius.circular(20.r)
                        : Radius.zero,
                  ),
                ),
                child: Text(
                  titleButton1,
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: onTap2,
                elevation: 0,
                hoverElevation: 0,
                highlightElevation: 0,
                focusElevation: 0,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                height: 40.h,
                color:
                isActive == 1 ? AppColors.colorRed : AppColors.colorPickUp,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.horizontal(
                    right: TranslateCubit.get(context).isArabic
                        ? Radius.zero
                        : Radius.circular(20.r),
                    left: TranslateCubit.get(context).isArabic
                        ? Radius.circular(20.r)
                        : Radius.zero,
                  ),
                ),
                child: Text(
                  titleButton2,
                  maxLines: 1,
                  style: TextStyle(
                    color: AppColors.colorWhite,
                    fontWeight: FontWeight.normal,
                    fontSize:TranslateCubit.get(context).isArabic?14.sp:16.sp,
                  ),
                ),
              ),
            ),
            Container(
              width: 80.w,
              height: 45.h,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
*/
