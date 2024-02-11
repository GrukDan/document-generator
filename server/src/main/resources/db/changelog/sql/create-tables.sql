BEGIN;

CREATE TABLE IF NOT EXISTS public.account
(
    id serial,
    email character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    account_name character varying(100) NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.role
(
    id serial,
    role_name character varying(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.account_role
(
    account_id serial,
    role_id serial
);

CREATE TABLE IF NOT EXISTS public.document_template
(
    id serial,
    template_name character varying(100) NOT NULL,
    path character varying(250) NOT NULL,
    created_at time with time zone NOT NULL,
    modified_at time with time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.account_document_template
(
    account_id serial,
    document_template_id serial
);

ALTER TABLE public.account_role
    ADD FOREIGN KEY (account_id)
        REFERENCES public.account (id)
        NOT VALID;


ALTER TABLE public.account_role
    ADD FOREIGN KEY (role_id)
        REFERENCES public.role (id)
        NOT VALID;


ALTER TABLE public.account_document_template
    ADD FOREIGN KEY (account_id)
        REFERENCES public.account (id)
        NOT VALID;


ALTER TABLE public.account_document_template
    ADD FOREIGN KEY (document_template_id)
        REFERENCES public.document_template (id)
        NOT VALID;

END;