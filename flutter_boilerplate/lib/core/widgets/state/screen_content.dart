import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/states/data_state.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_boilerplate/core/widgets/state/error_state_widget.dart';
import 'package:flutter_boilerplate/core/widgets/state/loading_state_widget.dart';

class ScreenContent<T> extends StatelessWidget {
  final DataState<T> state;
  final Widget Function(T data) successWidget;
  final bool overlayLoading;
  final Widget? loadingWidget;
  final Widget? errorWidget;

  /// An optional callback function for the error widget to handle data reloading.
  final VoidCallback? onRetry;

  const ScreenContent({
    super.key,
    required this.state,
    this.overlayLoading = false,
    required this.successWidget,
    this.loadingWidget,
    this.errorWidget,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Initial<T>():
        return const SizedBox.shrink();

      case Loading<T>():
        if (loadingWidget != null) {
          return loadingWidget!;
        }
        return const LoadingStateWidget();

      case Success<T>(data: final data):
        return Stack(
          children: [
            successWidget(data),
            if (overlayLoading)
              // Latar belakang gelap transparan
              ModalBarrier(
                dismissible: false,
                color: Colors.black.withValues(alpha: .5),
              ),
            if (overlayLoading)
              // Indikator loading di tengah
              Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Color.fromARGB(255, 82, 194, 51),
                  ),
                ).paddingAll(Dimens.md),
              ),
          ],
        );

      case Error<T>(message: final message):
        if (errorWidget != null) {
          return errorWidget!;
        }
        return ErrorStateWidget(
          subtitle: message,
          onButtonPressed: () {
            if (onRetry != null) {
              onRetry!();
            }
          },
        );
    }
  }
}

/*
 body: ScreenContent<String>(
        // 1. Pass the current state
        state: _dataState,
        
        // 2. Pass the overlay flag
        overlayLoading: _useOverlay,
        
        // 3. Provide the retry callback
        onRetry: () => _fetchData(),
        
        // 4. Define the widget for the Success state
        successWidget: (data) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '🎉 Success! 🎉',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data, // The data from the Success state
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () => _fetchData(),
                    child: const Text('Refresh Data'),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () => _fetchData(fail: true),
                    child: const Text('Simulate Error'),
                  ),
                ],
              ),
            ),
          );
        },



 */
