#名前、性別、サイズ、色、カテゴリ、季節、状態、価格、備考
names = %w(スーツ ドレス)
size = %w(S M L)
color = %w(white black yellow red blue)
season = %w(春 夏 秋 冬)
category = %w(formal informal)
value = 10000
0.upto(9) do |idx|
	Clothe.create(
		name: names[idx % 2],
		sex: idx % 4,
		size: size[idx % 3],
		color: color[idx % 5],
		category1: season[idx % 4],
		category2: category[idx % 2],
		state: 0,
		value: value + (idx * 1000),
		note: "aaaaaa",
		recommend: false
	)
end
