; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %ma = alloca i32, align 4
  %mb = alloca i32, align 4
  %md = alloca i32, align 4
  %mp = alloca i32, align 4
  %ms = alloca i32, align 4
  %x = alloca i32, align 4
  %zero = alloca i32, align 4
  %not_a = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  store i32 %sub, ptr %a, align 4
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 97
  store i32 %sub1, ptr %b, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 48
  store i32 %sub2, ptr %d, align 4
  %4 = load i32, ptr %a, align 4
  %5 = load i32, ptr %u, align 4
  %sub3 = sub i32 90, %5
  %or = or i32 %4, %sub3
  %shr = lshr i32 %or, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  store i32 %xor, ptr %ma, align 4
  %6 = load i32, ptr %b, align 4
  %7 = load i32, ptr %u, align 4
  %sub4 = sub i32 122, %7
  %or5 = or i32 %6, %sub4
  %shr6 = lshr i32 %or5, 8
  %and7 = and i32 %shr6, 255
  %xor8 = xor i32 255, %and7
  store i32 %xor8, ptr %mb, align 4
  %8 = load i32, ptr %d, align 4
  %9 = load i32, ptr %u, align 4
  %sub9 = sub i32 57, %9
  %or10 = or i32 %8, %sub9
  %shr11 = lshr i32 %or10, 8
  %and12 = and i32 %shr11, 255
  %xor13 = xor i32 255, %and12
  store i32 %xor13, ptr %md, align 4
  %10 = load i32, ptr %u, align 4
  %xor14 = xor i32 %10, 43
  %sub15 = sub i32 0, %xor14
  %shr16 = lshr i32 %sub15, 8
  %and17 = and i32 %shr16, 255
  %xor18 = xor i32 255, %and17
  store i32 %xor18, ptr %mp, align 4
  %11 = load i32, ptr %u, align 4
  %xor19 = xor i32 %11, 47
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %xor23 = xor i32 255, %and22
  store i32 %xor23, ptr %ms, align 4
  %12 = load i32, ptr %ma, align 4
  %13 = load i32, ptr %a, align 4
  %and24 = and i32 %12, %13
  %14 = load i32, ptr %mb, align 4
  %15 = load i32, ptr %b, align 4
  %add = add i32 %15, 26
  %and25 = and i32 %14, %add
  %or26 = or i32 %and24, %and25
  %16 = load i32, ptr %md, align 4
  %17 = load i32, ptr %d, align 4
  %add27 = add i32 %17, 52
  %and28 = and i32 %16, %add27
  %or29 = or i32 %or26, %and28
  %18 = load i32, ptr %mp, align 4
  %and30 = and i32 %18, 62
  %or31 = or i32 %or29, %and30
  %19 = load i32, ptr %ms, align 4
  %and32 = and i32 %19, 63
  %or33 = or i32 %or31, %and32
  store i32 %or33, ptr %x, align 4
  %20 = load i32, ptr %x, align 4
  %sub34 = sub i32 0, %20
  %shr35 = lshr i32 %sub34, 8
  %and36 = and i32 %shr35, 255
  %xor37 = xor i32 255, %and36
  store i32 %xor37, ptr %zero, align 4
  %21 = load i32, ptr %u, align 4
  %xor38 = xor i32 %21, 65
  %sub39 = sub i32 0, %xor38
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  store i32 %and41, ptr %not_a, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %zero, align 4
  %24 = load i32, ptr %not_a, align 4
  %and42 = and i32 %23, %24
  %or43 = or i32 %22, %and42
  ret i32 %or43
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
