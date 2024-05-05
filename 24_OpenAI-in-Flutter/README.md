# Summary

---

##### OpenAI in Flutter

OpenAi adalah salah satu platform yang menyediakan layanan AI (Artificial Intelligence) yang dapat digunakan untuk berbagai keperluan, seperti pengenalan teks, pengenalan gambar, dan lain-lain. OpenAI menyediakan berbagai model AI yang dapat digunakan untuk memecahkan masalah yang kompleks dan melakukan tugas-tugas yang memerlukan kecerdasan manusia. Dalam pengembangan aplikasi Flutter, OpenAI dapat digunakan untuk meningkatkan fungsionalitas dan kecerdasan aplikasi.

keuntuangan menggunakan OpenAI dalam pengembangan aplikasi Flutter adalah sebagai berikut: 1. Meningkatkan fungsionalitas aplikasi dengan menambahkan fitur-fitur AI. 2. Meningkatkan kecerdasan aplikasi dengan menggunakan model AI yang sudah terlatih. 3. Mempercepat pengembangan aplikasi dengan menggunakan API AI yang sudah tersedia. 4. Meningkatkan pengalaman pengguna dengan menyediakan fitur-fitur AI yang inovatif dan menarik.

Dengan menggunakan OpenAI dalam pengembangan aplikasi Flutter, pengembang dapat membuat aplikasi yang lebih cerdas, inovatif, dan menarik bagi pengguna. OpenAI juga memungkinkan pengembang untuk memecahkan masalah yang kompleks dan melakukan tugas-tugas yang memerlukan kecerdasan manusia dengan mudah dan efisien.

##### Contoh menggunakan OpenAI dalam Flutter

1. Mendapatkan API Key dari OpenAI.
2. install beberapa package yang berikut:

```bash
$ flutter pub add http
$ flutter pub add intl
$ flutter pub add envide
$ flutter pub add --dev envied_generator
$ flutter pub add --dev build_runner
```

3. Membuat file konfigurasi

```dart
OPEN_AI_API_KEY=YOUR_API_KEY
```

4. Membuat model untuk response dari OpenAI

```dart
import 'package:envided/envided.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
    @EnviedField(varName: 'OPEN_AI_API_KEY')
    static String apiKey = 'Env.apiKey';
}
```

5. Melakukan generate code untuk membaca .env

```bash
flutter pub run build_runner build
```

6. Membuat variabel untuk menyimpan API Key

```dart
import 'package:env\.env.dart';

String apiKey = Env.apiKey;
```

7. Membuat data model

```dart
import 'dart:convert';

GptData GptDataFromJson(String str) => GptData.fromJson(json.decode(str));

String GptDataToJson(GptData data) => json.encode(data.toJson());

Class GptData {
    GptData({
        this.id,
        this.object,
        this.created,
        this.model,
        this.choices,
        this.usage,
    });
    String id;
    String object;
    int created;
    String model;
    List<Choice> choices;
    Usage usage;

    Factory GptData.fromJson(Map<String, dynamic> json) => GptData(
        id: json['id'],
        object: json['object'],
        created: json['created'],
        model: json['model'],
        choices: List<Choice>.from(json['choices'].map((x) => Choice.fromJson(x))),
        usage: Usage.fromJson(json['usage']),
    );

    Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'choices': List<dynamic>.from(choices.map((x) => x.toJson())),
        'usage': usage.toJson(),
    };
}



Class Choice {
    Choice({
        Required this.text,
        Required this.index,
        this.logprobs,
        Required this.finishReason,
    });

    String text;
    int index;
    dynamic logprobs;
    String finishReason;

    Factory Choice.fromJson(Map<String, dynamic> json) => Choice(
        text: json['text'],
        index: json['index'],
        logprobs: json['logprobs'],
        finishReason: json['finish_reason'],
    );

    Map<String, dynamic> toJson() => {
        'text': text,
        'index': index,
        'logprobs': logprobs,
        'finish_reason': finishReason,
    };
}

class Usage {
    Usage({
        Required this.totalCharacters,
        Required this.totalTokens,
        Required this.totalChoices,
    });

    int totalCharacters;
    int totalTokens;
    int totalChoices;

    Factory Usage.fromJson(Map<String, dynamic> json) => Usage(
        totalCharacters: json['total_characters'],
        totalTokens: json['total_tokens'],
        totalChoices: json['total_choices'],
    );

    Map<String, dynamic> toJson() => {
        'total_characters': totalCharacters,
        'total_tokens': totalTokens,
        'total_choices': totalChoices,
    };
}
```

7. Membuat Komponen Service

```dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:openai_flutter/models/gpt_data.dart';
import 'package:openai_flutter/env/.env.dart';
import 'package:intl/intl.dart';

class Services {
    static Future<GptData> getRecomendations({
        required String carRegion,
        required String budget,
    }) async {
        late GptData data = GptData(
            id: '',
            object: '',
            created: 0,
            model: '',
            choices: [],
            usage: Usage(
                totalCharacters: 0,
                totalTokens: 0,
                totalChoices: 0,
            ),
        );
    }
    try {
        var url = Url.parse('https://api.openai.com/v1/engines/davinci/completions');

        Map<String, String> headers = {
            'Content-Type': 'application/json',
            'charset': 'utf-8',
            'Authorization': 'Bearer ${Env.apiKey}',
        };

        final formatCurenccy = NumberFormat.simpleCurrency(
            locale: 'id_ID',
            symbol: 'IDR',
            decimalDigits: 0,
        );

        String budgetFormatted = formatCurenccy.format(int.parse(budget));

        String prompt = 'I want to buy a car in $carRegion with a budget of $budgetFormatted.';

        final data = jsonEncode({
            'model': 'davinci',
            'prompt': prompt,
            'max_tokens': 100,
            'temperature': 0.5,
            'top_p': 1,
            'n': 1,
            'stop': ['\n'],
        });

        var response = await http.post(
            url,
            headers: headers,
            body: data,
        );

        if (response.statusCode == 200) {
            data = GptDataFromJson(response.body);
        }
    } catch (e) {
        throw Exception('Failed to get data');
    }
    return data;
}
```

8. Membuat Halaman Beranda

```dart
import 'package:flutter/material.dart';
import 'package:openai_flutter/services/services.dart';
import 'package:openai_flutter/models/gpt_data.dart';

class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    late Future<GptData> futureData;

    @override
    void initState() {
        super.initState();
        futureData = Services.getRecomendations(
            carRegion: 'Jakarta',
            budget: '200000000',
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('OpenAI in Flutter'),
            ),
            body: Center(
                child: FutureBuilder<GptData>(
                    future: futureData,
                    builder: (context, snapshot) {
                        if (snapshot.hasData) {
                            return Text(snapshot.data!.choices[0].text);
                        } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                        }
                        return CircularProgressIndicator();
                    },
                ),
            ),
        );
    }
}
```
