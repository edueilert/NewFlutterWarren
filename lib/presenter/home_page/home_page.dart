import '../home_page/widgets/bottom_navigationbar.dart';
import '../home_page/widgets/card_coin.dart';
import '../home_page/widgets/divider_app.dart';
import '../home_page/widgets/visible.dart';
import '../../presenter/providers/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 45, bottom: 5),
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Carteira',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            visible.state = !visible.state;
                          });
                        },
                        icon: Icon(visible.state
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ],
                  ),
                  visible.state
                      ? Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'pt-BR', decimalDigits: 2)
                              .format(14798.00),
                          style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const ContainerVisible(),
                  const SizedBox(height: 5),
                  Text(
                    '+R\$ (100% de CDI)',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  ),
                ],
              ),
            ),
            const DividerApp(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/litecoin");
              },
              child: const CardCoin(
                siglaMoeda: 'BTC',
                moeda: 'Bitcoin',
                valor: 6557.00,
                variacao: 0.65,
                imagem: Icons.monetization_on_rounded,
              ),
            ),
            const DividerApp(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/ethereum");
              },
              child: const CardCoin(
                siglaMoeda: 'ETH',
                moeda: 'Ethereum',
                valor: 7996.00,
                variacao: 0.94,
                imagem: Icons.monetization_on_rounded,
              ),
            ),
            const DividerApp(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/litecoin");
              },
              child: const CardCoin(
                siglaMoeda: 'LTC',
                moeda: 'Litecoin',
                valor: 245.00,
                variacao: 0.82,
                imagem: Icons.monetization_on_rounded,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarApp(),
    );
  }
}
