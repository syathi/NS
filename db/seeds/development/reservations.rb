day = Date.today - 4
prefecture = %w(A B C D) #県
city = %w(N M L)
town = %w(V W X Y Z)

0.upto(9) do |idx|
	Reservation.create(
		userId: idx,
		clothesId: idx,
		returnDay: day + idx,
		sendDay: day - 7 + idx,
		sendAdress: "#{prefecture[idx % 4]}県#{city[idx % 3]}市#{town[idx % 5]}町",
		isSend: idx < 6 ? true : false
			
	)
end