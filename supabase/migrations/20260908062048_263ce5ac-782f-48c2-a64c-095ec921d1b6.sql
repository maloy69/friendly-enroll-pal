INSERT INTO public.profiles (id, email, full_name)
VALUES ('19d36f84-8c85-492e-bf1b-21ac5b59dcbb', 'arisanto@mentarisatria.net.id', 'Administrator SPMB')
ON CONFLICT (id) DO UPDATE SET full_name = EXCLUDED.full_name, email = EXCLUDED.email;

INSERT INTO public.user_roles (user_id, role)
VALUES ('19d36f84-8c85-492e-bf1b-21ac5b59dcbb', 'admin'),
       ('19d36f84-8c85-492e-bf1b-21ac5b59dcbb', 'operator')
ON CONFLICT DO NOTHING;

DELETE FROM public.user_roles
WHERE user_id = '19d36f84-8c85-492e-bf1b-21ac5b59dcbb' AND role = 'wali';