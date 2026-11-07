; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_4.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
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
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  store i32 %and9, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor10 = xor i32 %4, 63
  %sub11 = sub i32 0, %xor10
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr12, 255
  store i32 %and13, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and14 = and i32 %5, %add
  store i32 %and14, ptr %p, align 4
  %7 = load i32, ptr %a, align 4
  %xor15 = xor i32 %7, 255
  %8 = load i32, ptr %b, align 4
  %and16 = and i32 %xor15, %8
  %9 = load i32, ptr %x.addr, align 4
  %add17 = add i32 %9, 71
  %and18 = and i32 %and16, %add17
  store i32 %and18, ptr %q, align 4
  %10 = load i32, ptr %b, align 4
  %xor19 = xor i32 %10, 255
  %11 = load i32, ptr %c, align 4
  %and20 = and i32 %xor19, %11
  %12 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %12, -4
  %and22 = and i32 %and20, %add21
  store i32 %and22, ptr %r, align 4
  %13 = load i32, ptr %d, align 4
  %xor23 = xor i32 %13, 255
  %and24 = and i32 %xor23, 45
  store i32 %and24, ptr %s, align 4
  %14 = load i32, ptr %e, align 4
  %xor25 = xor i32 %14, 255
  %and26 = and i32 %xor25, 95
  store i32 %and26, ptr %t, align 4
  %15 = load i32, ptr %p, align 4
  %not = xor i32 %15, -1
  %16 = load i32, ptr %q, align 4
  %not27 = xor i32 %16, -1
  %and28 = and i32 %not, %not27
  %17 = load i32, ptr %r, align 4
  %not29 = xor i32 %17, -1
  %and30 = and i32 %and28, %not29
  %18 = load i32, ptr %s, align 4
  %not31 = xor i32 %18, -1
  %and32 = and i32 %and30, %not31
  %19 = load i32, ptr %t, align 4
  %not33 = xor i32 %19, -1
  %and34 = and i32 %and32, %not33
  %not35 = xor i32 %and34, -1
  ret i32 %not35
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
