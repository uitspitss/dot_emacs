=================================================
Sphinxからプレゼンテーションスライドを作ってみた
=================================================


おまえだれよ
-------------
* 清水川というのよ
* フリーランスなのよ
* `http://清水川.jp/`  @shimizukawa
* Sphinxでドキュメント書いてRailsで実装
* Sphinx系, Zope/Plone系, pyspa系, XP系
* Python, Rails, 昔はC++/C/8086

.. figure:: sphinxusers.jpg

.. s6:: effect slide

.. s6:: styles

    'ul': {fontSize:'65%'},
    'div': {textAlign: 'right'},
    'div/img': {width:'60%'}


エキPy 第2刷でました
----------------------
* エキスパートPythonプログラミング
   * アスキー・メディアワークス
   * B5変 (416ページ)
   * 3780円

* 稲田、渋川、清水川、森本 訳

.. figure:: epp.jpg

.. s6:: effect slide

.. s6:: styles

    'div': {position:'absolute', right:0, bottom:0, textAlign:'right'},
    'div/img': {width:'30%'}

電子書籍に電子サインもらた！
-----------------------------

.. figure:: kinoko-esign.png

.. s6:: effect slide


@t_wada氏とツーショット！
--------------------------

.. figure:: twoshot.jpg

.. s6:: effect slide


(´･ω･`)
----------

.. s6:: effect slide

.. s6:: styles

    h2: {fontSize:'150%', textAlign:'center', margin:'30% auto'}



イベントのお知らせ
--------------------
毎月勉強会などをやってます。

* 2/12(土) Sphinx+翻訳ハッカソン
* 2/1(火) エキPy読書会08
* 3/4(金) OSCでSphinxセミナー
* 3/中旬(予定) Python mini Hack-a-thon

ATNDで探してね

.. s6:: effect slide

.. s6:: styles

    'h2': {textAlign:'center',top:'40%'},
    'ul': {display:'none', fontSize:'20px'},
    'p': {display:'none'},

.. s6:: actions

    ['h2', 'move', '0.3', [0,40],[0,0]],
    ['p[0]', 'fade in', '0.3'],
    ['ul', 'fade in', '0.3'],
    ['p[1]', 'fade in', '0.3'],


PyCon JP の次のイベント
------------------------

* 夏ぐらいにやりたいですねー
* 会場スポンサー、募集中です！
* 俺が仕切るぜ！っていう人、大募集！

今回の案内メールにある contact@ にメールください！


.. s6:: styles

    'ul/li': {display:'none'},
    'p[0]': {display:'none'}

.. s6:: actions

    ['ul/li[0]', 'fade in', '0.3'],
    ['ul/li[1]', 'fade in', '0.3'],
    ['ul/li[2]', 'fade in', '0.3'],
    ['p[0]', 'fade in', '0.3'],


このスライドについて
----------------------
このプレゼンテーションは

* Sphinxで作成して、
* S6 (c) 2007 Cybozu Labs, Inc. を組み込んで、
* ブラウザで表示してます


ちょっとreSTソース
--------------------

`index.rst <_sources/index.txt>`_

.. s6:: styles

    'p': {fontSize:'200%'},


スライド表示の例
-------------------

* 箇条書き
    1. 番号付き箇条書き
    2. http://sphinx-users.jp/

* **強調** , *エモーション*
* `リテラル` , ``リテラル``
* :command:`command`


スライド切替エフェクト
-----------------------
種類

* スライド: 横にslide
* フェード: fade
* フェード2: fadeScale
* 上からフェード: fadeScaleFromUp
* 拡大: fadeScaleFromUpTransparent


エフェクト : スライド
----------------------
右から左にスライドインします

::

    .. s6:: effect slide

.. s6:: effect slide


エフェクト : フェード
----------------------
フェードイン・フェードアウトで切り替えます（デフォルト動作）

::

    .. s6:: effect fade

.. s6:: effect fade


エフェクト : 縮小フェードアウト
--------------------------------
現在のスライドを縮小アニメーションして次のスライドに切り替えます

::

    .. s6:: effect fadeScale

.. s6:: effect fadeScale


エフェクト : 縮小フェードイン
------------------------------
次のスライドを縮小アニメーションしながら表示します

::

    .. s6:: effect fadeScaleFromUp

.. s6:: effect fadeScaleFromUp


拡大エフェクト
---------------
次のスライドを **半透明** 縮小アニメーションしながら表示します

::

    .. s6:: effect fadeScaleFromUpTransparent

.. s6:: effect fadeScaleFromUpTransparent


アクション
------------
スライド内でエレメントを動かすアクションの種類

* fade: fade in
* move: 移動
* scale: 拡大縮小


アクション : フェードイン
--------------------------
対象のエレメントを複数回に分けてフェードイン表示します。

* 箇条書きの文章１
* 箇条書きの文章２
* 箇条書きの文章３

.. s6:: styles

    'ul/li': {display:'none'}

.. s6:: actions

    ['ul/li[0]', 'fade in', '0.3'],
    ['ul/li[1]', 'fade in', '0.3'],
    ['ul/li[2]', 'fade in', '0.3'],


アクション : 移動
-------------------
対象のエレメントを移動させながら表示したり非表示にしたりします。

* 箇条書きの文章１
* 箇条書きの文章２
* 箇条書きの文章３

.. s6:: actions

    ['ul', 'move', '5.0', [0,0],[100,0]]


センタリング
-------------

.. s6:: styles

    h2: {fontSize:'150%', textAlign:'center', margin:'30% auto'}


画像をレイアウトする例
-----------------------
* コミュニティー:
   * Python, Sphinx
* 言語:
   * Python, reStructuredText

.. figure:: sphinxusers.jpg

.. s6:: styles

    'div': {textAlign: 'right'},
    'div/img': {width: '60%'},


Textと画像のレイアウト例
--------------------------

.. code-block:: rst

    Sphinxのサンプル
    =================

    Sphinxとは何か？
    -----------------
    * ドキュメント生成のツール
    * reStructuredText記法(Wikiっぽい?
    * ページ間のリンクを自動生成
    * 強力なコードハイライト
    * HTML, PDF, ePub, htmlhelp, latex, man...

.. figure:: sphinx-sample.jpg

.. s6:: styles

    'div[0]': {width: '60%', position:'absolute', left:'0', marginTop:'0.3em'},
    'div[0]/div/pre': {fontSize:'35%', padding:'1em'},
    'div[1]': {position:'absolute', right:'0', bottom: '0', width:'60%'},

(´･ω･`)
-----------

.. figure:: shobon.jpg

.. s6:: styles

    'h2': {display:'none'},
    'div': {textAlign: 'center'},
    'div/img': {width:'100%'},


ほかのプレゼンJSを組み込んでみた
---------------------------------
.. s6:: effect slide

.. s6:: styles

    h2: {fontSize:'150%', textAlign:'center', margin:'30% auto'}


HTML slide
------------
http://jsdo.it/nabetama/k6lQ

