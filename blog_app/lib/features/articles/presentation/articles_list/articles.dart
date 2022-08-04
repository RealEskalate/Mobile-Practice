import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../bloc/filter/filter_bloc.dart';
import '../../utils/assets.dart';
import '../../utils/styles.dart';
import 'components/article_card.dart';
import 'components/circular_avatar.dart';
import 'components/drawer.dart';
import 'components/group_buttons.dart';
import 'components/search_bar.dart';
import 'loading_page.dart';

class ArticlesListPage extends StatefulWidget {
  static const routeName = "articles_list";

  const ArticlesListPage({Key? key}) : super(key: key);

  @override
  State<ArticlesListPage> createState() => _ArticlesListPageState();
}

class _ArticlesListPageState extends State<ArticlesListPage> {
  int selectedId = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    debugPrint("InitState...");
    BlocProvider.of<FilterBloc>(context).add(FilterChanged(id: selectedId));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        debugPrint("onRefresh");
        BlocProvider.of<FilterBloc>(context).add(FilterChanged(id: selectedId));
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          //toolbarHeight: 80,
          leading: IconButton(
            icon:
                SvgPicture.asset(Assets.filter, semanticsLabel: 'Filter icon'),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Row(
            children: [
              const Expanded(
                  child: Text("Welcome Back!",
                      textAlign: TextAlign.center, style: Styles.appBarText)),
              CircularAvator(
                  onPressed: () {
                    debugPrint("UserProfile clicked");
                  },
                  imageUrl:
                      "https://previews.123rf.com/images/rido/rido2002/rido200200099/141040315-happy-smiling-african-doctor-looking-at-camera-in-medical-office-portrait-of-black-man-doctor-workin.jpg?fj=1")
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const Drawer(
            child: CustomDrawer(
          profession: "UI/UX Designer",
          fullName: "Adrian Smith",
          imageUrl:
              "https://previews.123rf.com/images/rido/rido2002/rido200200099/141040315-happy-smiling-african-doctor-looking-at-camera-in-medical-office-portrait-of-black-man-doctor-workin.jpg?fj=1",
          email: 'adrian.smith@gmail.com',
        )),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  debugPrint("BlocBuilder body...");
                  if (state is FilterStateLoading) {
                    debugPrint("Loading...");
                    return const ArticlesLoadingPage();
                  } else if (state is FilterStateError) {
                    return const Center(
                        child: Text("Sorry, something went wrong!"));
                  } else if (state is FilterStateSuccess) {
                    debugPrint("Filter State Success");
                    List<ArticleCard> articles = state.items
                        .map(
                          (e) => ArticleCard(article: e),
                        )
                        .toList();

                    return Column(mainAxisSize: MainAxisSize.min, children: [
                      SearchBar(
                        onSearch: (searchTerm) {
                          BlocProvider.of<FilterBloc>(context)
                              .add(OnSearch(searchTerm: searchTerm));
                          debugPrint('Search term: ' + searchTerm);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GroupButtons(
                        selectedIdx: state.id,
                        buttons: FilterState.filters,
                        onChange: (selected) {
                          selectedId = selected;
                          BlocProvider.of<FilterBloc>(context)
                              .add(FilterChanged(id: selectedId));
                        },
                      ),
                      ...articles
                    ]);
                  }
                  debugPrint("Undefined State");
                  return Container();
                },
              )),
        ),
      ),
    );
  }
}
