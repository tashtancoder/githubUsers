import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_event.dart';
import 'package:githubUsers/blocs/user_details_bloc/user_details_state.dart';
import 'package:githubUsers/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailsView extends StatefulWidget {
  //final String userName;
  UserDetailsView();
  @override
  UserDetailsWidgetState createState() {
    // TODO: implement createState
    return UserDetailsWidgetState();
  }

}

class UserDetailsWidgetState extends State<UserDetailsView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<UserDetailsBloc, UserDetailsState>(
      builder: (context, state) {
        if (state is UserDetailsInitial || state is UserDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserDetailsLoaded){
          return ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [appBackgroundColor, profileBackgroundColor],
                  )
                ),
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: state.userDetails.userName,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(state.userDetails.avatarUrl),
                      ),
                    ),

                    const SizedBox(height: 20,),
                    Text(
                      state.userDetails.name,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      state.userDetails.type,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (await canLaunchUrl(Uri.parse(state.userDetails.reposUrl))) {
                              //await launchUrl(Uri.parse(state.userDetails.reposUrl));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange.shade200
                          ),
                          child: SizedBox(
                            width: 130,
                            child: ListTile(
                              title: Text(
                                state.userDetails.publicRepos.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              subtitle: const Text(
                                'Repos',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            if (await canLaunchUrl(Uri.parse(state.userDetails.gistsUrl))) {
                              //await launchUrl(Uri.parse(state.userDetails.gistsUrl));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo.shade200
                          ),
                          child: SizedBox(
                            width: 130,
                            child: ListTile(
                              title: Text(
                                state.userDetails.publicGists.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                              subtitle: const Text(
                                'Gists',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.grey,
                                  width: 1
                                ),
                                right: BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                ),


                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                state.userDetails.followersSize.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: const Text(
                                'Followers',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: Colors.grey,
                                    width: 1
                                ),
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                state.userDetails.followingSize.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              subtitle: const Text(
                                'Following',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(FontAwesomeIcons.github),
                      title: Text(
                        '@${state.userDetails.userName}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async => {
                        if (await canLaunchUrl(Uri.parse(state.userDetails.webLink))) {
                          await launchUrl(Uri.parse(state.userDetails.webLink))
                        }

                      },
                    ),
                    const Divider(),
                    if (state.userDetails.email.isNotEmpty) ListTile(
                      leading: const Icon(Icons.mail),
                      title: Text(
                        state.userDetails.email,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async => {
                        if (await canLaunchUrl(Uri.parse('mailto:${state.userDetails.email}'))) {
                          await launchUrl(Uri.parse('mailto:${state.userDetails.email}'))
                        }
                      },
                    ) else Container(),
                    if (state.userDetails.email.isNotEmpty) const Divider() else Container(),
                    if (state.userDetails.location.isNotEmpty) ListTile(
                      leading: const Icon(Icons.location_on),
                      title: Text(
                        state.userDetails.location,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () async => {
                        if (await canLaunchUrl(Uri.parse('https://www.google.com/maps/search/${Uri.encodeFull(state.userDetails.location)}'))) {
                          await launchUrl(Uri.parse('https://www.google.com/maps/search/${Uri.encodeFull(state.userDetails.location)}'))
                        }
                      },
                    ) else Container(),
                    if (state.userDetails.location.isNotEmpty) const Divider() else Container(),
                  ],
                ),
              )

            ],
          );
        } else {
          return Center(
            child: Text((state as UserDetailsError).msg),
          );
        }
      },
    );
  }

}