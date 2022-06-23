import Mcbride

universe u

def mapPair {α α' β β' : Type u} (f : α → α') (g : β → β') : Product α β → Product α' β'
| ⟨a, b⟩ => ⟨f a, g b⟩
