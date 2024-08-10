
NAME:= fdf

SRCS:= main.c
OBJS:= $(SRCS:%.c=%.o)
MLX:= mlx_linux/

CFLAGS:= -Wall -Wextra -Werror
RM:= rm -f

all: $(NAME)

$(NAME): $(OBJS) $(MLX_A)
	@$(CC) $(OBJS) -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -o $(NAME)
	@echo "Linked into executable \033[0;32mfdf\033[0m."

$(MLX_A):
	@$(MAKE) -s -C $(MLX)

.c.o:
	@$(CC) -I/usr/include -Imlx_linux -O3 -c $< -o $@
	@echo "Compiling $<."

clean:
	@$(RM) $(OBJS)
	@(MAKE) clean -s -C $(MLX)

fclean: clean
	@$(RM) $(NAME)
	
re: fclean all