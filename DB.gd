extends Node
var USER = "postgres"
var PASSWORD = "password"
var HOST = "localhost"
var PORT = 5432
var DATABASE = "postgres"

var database: PostgreSQLClient = PostgreSQLClient.new()
var datatext : Array = []

func _init() -> void:
	database.connect("connection_established", Callable(self, "_connection_established"))
	database.connect("authentication_error", Callable(self, "_authentication_error"))
	database.connect("connection_closed", Callable(self, "_connection_close"))
	database.connect("data_received", Callable(self, "_data_received"))

	#Connection to the database
	database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [USER, PASSWORD, HOST, PORT, DATABASE])


func _physics_process(_delta: float) -> void:
	database.poll()


func _connection_established() -> void:


	var error := database.execute("""
		BEGIN;
		SELECT name, score FROM public.scoreboard
		""")


func _data_received(error_object: Dictionary, transaction_status: PostgreSQLClient.TransactionStatus, datas: Array) -> void:


	var tekst = datas[1].data_row
	var j = 0
	for i in tekst:
		datatext.insert(0, datas[1].data_row[j])
		j += 1
	database.close()

func insertScore(name_pl,score):
	database.connect_to_host("postgresql://%s:%s@%s:%d/%s" % [USER, PASSWORD, HOST, PORT, DATABASE])
	var data = database.execute("""
	INSERT INTO public.scoreboard (name, score) VALUES ('%s', %s);
	""" % [name_pl,score])
	database.close()


func _authentication_error(error_object: Dictionary) -> void:
	prints("Error connection to database:", error_object["message"])


func _connection_close(clean_closure := true) -> void:
	prints("DB CLOSE,", "Clean closure:", clean_closure)


func _exit_tree() -> void:
	database.close()

func show_me_best_player() -> Array:
	return datatext
