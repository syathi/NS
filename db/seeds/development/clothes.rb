#名前、性別、サイズ、色、カテゴリ、季節、状態、価格、備考
names = %w(スーツ ドレス)
size = %w(S M L)
color = %w(white black yellow red blue)
season = %w(春 夏 秋 冬)
situation = %w(結婚式 成人式 葬式 祭り おしゃれ 七五三 パーティー)
value = 10000
0.upto(7) do |idx|
	clothe = Clothe.create(
		name: names[idx % 2],
		sex: idx % 4,
		size: size[idx % 3],
		color: color[idx % 5],
		category1: season[idx % 4],
		category2: situation[idx % 7],
		state: 0,
		value: value + (idx * 1000),
		note: "aaaaaa",
		recommend: false
	)
	path = Rails.root.join("db/seeds/development", "clothe#{idx % 3 + 1}.jpg")
   	file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
   	ClotheImage.create(
    	clothe: clothe,
    	uploaded_image: file
    )
end
