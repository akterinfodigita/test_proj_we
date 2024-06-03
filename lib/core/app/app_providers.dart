import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dokan/core/app/app_dependency.dart';
import 'package:dokan/features/screens/no_internet/cubit/internet_cubit.dart';

import '../../features/screens/theme/cubit/theme_cubit.dart';

class AppProviders {
  static final providers = <BlocProvider>[
        BlocProvider<ThemeCubit>(
            create: (BuildContext context) => instance<ThemeCubit>()),
      ] +
      <BlocProvider>[
        BlocProvider<InternetCubit>(
            create: (BuildContext context) => instance<InternetCubit>()),
      ];
}
