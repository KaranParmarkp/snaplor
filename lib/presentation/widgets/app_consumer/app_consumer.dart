import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/utils.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/error_screen.dart';
import 'package:jyotishee/presentation/widgets/app_consumer/status_screens/loader.dart';
import '../../../data/providers/providers.dart';
import '../../../data/providers/providers.dart';

/// T is used for provider whereas K is used for result type like list of model
class AppConsumer<T extends BaseProvider, K> extends StatefulWidget {
  final Function(T provider) load;
  final Widget Function(K data,T provider) successBuilder;
  final Widget Function(T)? errorBuilder;
  final Widget Function(T)? loaderBuilder;
  final String taskName;
  final bool showError;
  final bool refresh;

  const AppConsumer({
    Key? key,
    required this.taskName,
    required this.load,
    required this.successBuilder,
    this.errorBuilder,
    this.showError = false,
    this.loaderBuilder,
    this.refresh = true,
  }) : super(key: key);

  @override
  _AppConsumerState<T, K> createState() => _AppConsumerState<T, K>();
//  State<ProviderHandler<T extends BaseModel, K>> createState() => _ProviderHandlerState<T extends BaseModel, K>();
}

class _AppConsumerState<T extends BaseProvider, K>
    extends State<AppConsumer<T, K>> {
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance!.addPostFrameCallback((_) async {
     Future.microtask(() async {
       var _provider = Provider.of<T>(context, listen: false);
       //await
       widget.load(_provider);
     });

    //});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(builder: (context, _provider, __) {
      switch (_provider.status[widget.taskName]) {
        case Status.Loading:
          return widget.loaderBuilder != null
              ? widget.loaderBuilder!(_provider)
              : Center(
                  child: Loader(),
                );
        case Status.Error:
          if (widget.showError) {
            AppHelper.showToast(
                message: _provider.error[widget.taskName].toString());
            _provider.reset(widget.taskName);
            return SizedBox();
          } else {
            //_provider.reset(taskName);
            return widget.errorBuilder != null
                ? widget.errorBuilder!(_provider)
                : ErrorScreen(
                    error: _provider.error[widget.taskName]!,
                    showRefresh: true,
                    onTap: () async => await widget.load(_provider),
                  );
          }
        case Status.Success:
          return RefreshIndicator(
            onRefresh: () async {
              if (widget.refresh) await widget.load(_provider);
            },
            color: AppColors.black,
            child: _provider.data[widget.taskName] == null
                ? ErrorScreen(
                    error: "No Data Available",
                  )
                : _provider.data[widget.taskName] is List &&
                        _provider.data[widget.taskName].isEmpty
                    ? ErrorScreen(
                        error: "No Data Available",
                      )
                    :
            Scrollbar(
              child: widget.successBuilder(
                  _provider.data[widget.taskName] as K,_provider),
            )
          );
        default:
          return SizedBox();
      }

    });
  }
}
