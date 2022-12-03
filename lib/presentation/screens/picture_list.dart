import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_show_api/aplication/bloc/picture_bloc.dart';
import 'package:image_show_api/di/get_it.dart';
import 'package:image_show_api/model/picture_model.dart';
import 'package:image_show_api/route/route_constants.dart';

class PictureList extends StatelessWidget {
  const PictureList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picture List')),
      body: BlocProvider(
        create: (context) => getIt<PictureBloc>()..add(StartPictureGetEvent()),
        child: BlocBuilder<PictureBloc, PictureState>(
          builder: (context, state) {
            if (state is PictureLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PicturesLoaded) {
              return ListView.builder(
                  itemCount: state.pictureList.length,
                  itemBuilder: (BuildContext context, index) {
                    PictureModel picture = state.pictureList[index];
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          RouteList.fullPictureScreen,
                          arguments: picture),
                      child: Card(
                        child: Column(
                          children: [
                            Hero(
                              tag: 'cardImage${picture.id}',
                              child: Image.network(
                                picture.urls.small,
                                fit: BoxFit.fitHeight,
                                width: 600.0,
                                height: 240.0,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                picture.user.name,
                              ),
                              subtitle: Text(picture.description ?? ""),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              return const Text('Oops.. Something went wrong:(');
            }
          },
        ),
      ),
    );
  }
}
