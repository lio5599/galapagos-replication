; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/0_b64_byte_to_char_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/0_b64_byte_to_char_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %p = alloca i32, align 4
  %q = alloca i32, align 4
  %r = alloca i32, align 4
  %s = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 0, %xor
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  store i32 %shr9, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %5, %add
  store i32 %and, ptr %p, align 4
  %7 = load i32, ptr %a, align 4
  %not = xor i32 %7, -1
  %8 = load i32, ptr %b, align 4
  %and10 = and i32 %not, %8
  %9 = load i32, ptr %x.addr, align 4
  %add11 = add i32 %9, 71
  %and12 = and i32 %and10, %add11
  store i32 %and12, ptr %q, align 4
  %10 = load i32, ptr %b, align 4
  %not13 = xor i32 %10, -1
  %11 = load i32, ptr %c, align 4
  %and14 = and i32 %not13, %11
  %12 = load i32, ptr %x.addr, align 4
  %add15 = add i32 %12, -4
  %and16 = and i32 %and14, %add15
  store i32 %and16, ptr %r, align 4
  %13 = load i32, ptr %d, align 4
  %not17 = xor i32 %13, -1
  %and18 = and i32 %not17, 43
  store i32 %and18, ptr %s, align 4
  %14 = load i32, ptr %e, align 4
  %not19 = xor i32 %14, -1
  %and20 = and i32 %not19, 47
  store i32 %and20, ptr %t, align 4
  %15 = load i32, ptr %p, align 4
  %not21 = xor i32 %15, -1
  %16 = load i32, ptr %q, align 4
  %not22 = xor i32 %16, -1
  %and23 = and i32 %not21, %not22
  %17 = load i32, ptr %r, align 4
  %not24 = xor i32 %17, -1
  %and25 = and i32 %and23, %not24
  %18 = load i32, ptr %s, align 4
  %not26 = xor i32 %18, -1
  %and27 = and i32 %and25, %not26
  %19 = load i32, ptr %t, align 4
  %not28 = xor i32 %19, -1
  %and29 = and i32 %and27, %not28
  %not30 = xor i32 %and29, -1
  %and31 = and i32 %not30, 255
  ret i32 %and31
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
