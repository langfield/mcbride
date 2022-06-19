-- An exploration of examples from Conor McBride's CS410: Advanced Functional
-- Programming. Originally written in Agda, translated to Lean 4.

inductive Zero : Type u where
#check Zero

structure One : Type where
#check One
#check One.mk
#check ({ } : One)

-- This is Conor's `+`.
inductive Either (S : Type u) (T : Type u) : Type u where
  | inl : S → Either S T
  | inr : T → Either S T

structure Product (S : Type u) (T : Type u) : Type u where
  fst : S
  snd : T

theorem productIsCommutative : Product α β → Product β α := by
  intro h
  let a := h.fst
  let b := h.snd
  apply Product.mk
  assumption
  assumption

theorem eitherIsCommutative : Either A B → Either B A := by
  intro h
  cases h
  apply Either.inr
  assumption
  apply Either.inl
  assumption

theorem eitherIsAssociative : Either (Either α β) γ → Either α (Either β γ) := by
  intro h
  cases h
  case inl h =>
    cases h
    apply Either.inl
    assumption
    apply Either.inr
    apply Either.inl
    assumption
  case inr h =>
    apply Either.inr
    apply Either.inr
    assumption

#check eitherIsAssociative


def hello := "world"
