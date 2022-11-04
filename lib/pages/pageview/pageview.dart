import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/pageview_bloc.dart';
import 'element_list.dart';

final PageController controller = PageController();

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PageviewBloc(),
        child: BlocBuilder<PageviewBloc, PageviewState>(
          builder: (context, state) {
            return SafeArea(
              child: Stack(children: [
                PageView.builder(
                  itemCount: widgetList.length,
                  controller: controller,
                  itemBuilder: (context, index) {
                    BlocProvider.of<PageviewBloc>(context).add(ShowDots(index));
                    return widgetList[index];
                  },
                ),
                state.myCol
              ]),
            );
          },
        ),
      ),
    );
  }
}

