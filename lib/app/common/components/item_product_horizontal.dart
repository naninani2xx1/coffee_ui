import 'package:coffee_kst/app/screens/home/domain/entities/product.dart';
import 'package:coffee_kst/main_export.dart';

class ItemProductHorizontal extends StatelessWidget {
  const ItemProductHorizontal({Key? key, required this.entity})
      : super(key: key);
  final ProductEntity entity;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: AppStyles.borderRadius12,
      ),
      child: Container(
        padding: const EdgeInsets.all(7.0),
        constraints: const BoxConstraints(maxHeight: 130.0, minHeight: 100.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: AppStyles.borderRadius12,
                  child: Hero(
                    tag: entity.id,
                    child: ImageWidget(
                      url: entity.imageUrl,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets(
                        text: entity.name,
                        fontSize: AppDimens.text16,
                        textColor: AppColors.darkColor,
                      ),
                      const SizedBox(height: 5.0),
                      TextWidgets(
                        text: Convert.instance.convertVND(entity.price1),
                        fontSize: AppDimens.text14,
                        textColor: AppColors.textErrorColor,
                      ),
                      const SizedBox(height: 5.0),
                      TextWidgets(
                        text: 'Loại: ${entity.categName} / 1 ${entity.unit}',
                        fontSize: AppDimens.text12,
                        textColor: AppColors.disableTextColor,
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextWidgets(
                            text: 'Đánh giá:',
                            fontSize: AppDimens.text10,
                            textColor: AppColors.disableTextColor,
                          ),
                          const Spacer(),
                          entity.countRating == null
                              ? TextWidgets(
                                  text: 'Chưa có',
                                  fontSize: AppDimens.text10,
                                  textColor: AppColors.disableTextColor,
                                )
                              : ItemStar(
                                  star: double.parse(entity.countRating)
                                      .toInt()
                                      .toString()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(AppIcons.FAVORITE_ASSET),
            )
          ],
        ),
      ),
    );
  }
}
