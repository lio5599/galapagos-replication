; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/0_b64_byte_to_char_6.c"
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
  %u = alloca i32, align 4
  %v = alloca i32, align 4
  %w = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
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
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  store i32 %and7, ptr %u, align 4
  %5 = load i32, ptr %a, align 4
  %xor = xor i32 %5, 255
  %6 = load i32, ptr %b, align 4
  %and8 = and i32 %xor, %6
  %7 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %7, 71
  %and10 = and i32 %and8, %add9
  store i32 %and10, ptr %v, align 4
  %8 = load i32, ptr %b, align 4
  %xor11 = xor i32 %8, 255
  %9 = load i32, ptr %c, align 4
  %and12 = and i32 %xor11, %9
  %10 = load i32, ptr %x.addr, align 4
  %add13 = add i32 %10, -4
  %and14 = and i32 %and12, %add13
  store i32 %and14, ptr %w, align 4
  %11 = load i32, ptr %x.addr, align 4
  %xor15 = xor i32 %11, 62
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  %and18 = and i32 %shr17, 255
  %xor19 = xor i32 %and18, 255
  %and20 = and i32 %xor19, 43
  store i32 %and20, ptr %y, align 4
  %12 = load i32, ptr %x.addr, align 4
  %xor21 = xor i32 %12, 63
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 %and24, 255
  %and26 = and i32 %xor25, 47
  store i32 %and26, ptr %z, align 4
  %13 = load i32, ptr %u, align 4
  %not = xor i32 %13, -1
  %14 = load i32, ptr %v, align 4
  %not27 = xor i32 %14, -1
  %and28 = and i32 %not, %not27
  %15 = load i32, ptr %w, align 4
  %not29 = xor i32 %15, -1
  %and30 = and i32 %and28, %not29
  %16 = load i32, ptr %y, align 4
  %not31 = xor i32 %16, -1
  %and32 = and i32 %and30, %not31
  %17 = load i32, ptr %z, align 4
  %not33 = xor i32 %17, -1
  %and34 = and i32 %and32, %not33
  %not35 = xor i32 %and34, -1
  %and36 = and i32 %not35, 255
  ret i32 %and36
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
