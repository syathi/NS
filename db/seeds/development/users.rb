 #名前、パスワード、住所、電話番号、秘密の質問、質問の答え
fnames = %w(田中 佐藤 鈴木 高橋)
gnames = %w(太郎 次郎 花子)
prefecture = %w(A B C D) #県
city = %w(N M L)
town = %w(V X X Y Z)
answers = %w(ピザ 寿司 パフェ)
0.upto(9) do |idx|
	User.create(
		name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
		adress: "#{prefecture[idx % 4]}県#{city[idx % 3]}市#{town[idx % 5]}町",
		tel: "090-0000-000" + idx.to_s,
		mail: "example" + idx.to_s + "@gmail.com",
		secretques: "好きな食べ物は?",
		secretans: answers[idx % 3],
		isFreeze: false,
		password: "password",
		password_confirmation: "password"
	)
end
