import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/presenter/home_page/widgets/visible.dart';
import 'package:myapp/presenter/providers/visibility_provider.dart';

class CardCoin extends StatefulHookConsumerWidget {
  final String moeda;
  final String siglaMoeda;
  final double valor;
  final double variacao;
  final IconData imagem;

  const CardCoin({
    Key? key,
    required this.moeda,
    required this.siglaMoeda,
    required this.valor,
    required this.variacao,
    required this.imagem,
  }) : super(key: key);

  @override
  ConsumerState<CardCoin> createState() => _CardCoinState();
}

class _CardCoinState extends ConsumerState<CardCoin> {
  bool visible = true;

  void changeVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var visible = ref.watch(visibilityProvider.state);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.siglaMoeda,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 8),
              Text(
                widget.moeda,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
              ),
            ],
          ),
          const Spacer(),
          visible.state
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      (widget.valor.toString()),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          widget.variacao.toString(),
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.siglaMoeda,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              : Column(
                  children: const [
                    ContainerVisible(),
                    SizedBox(height: 8),
                    ContainerVisible(),
                  ],
                ),
          const SizedBox(width: 10),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey.shade500,
            size: 16,
          )
        ],
      ),
    );
  }
}
