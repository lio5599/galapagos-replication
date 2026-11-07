; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r1/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  store i32 %not, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  %not6 = xor i32 %shr5, -1
  store i32 %not6, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub7 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub8 = sub i32 57, %6
  %or9 = or i32 %sub7, %sub8
  %shr10 = lshr i32 %or9, 8
  %not11 = xor i32 %shr10, -1
  store i32 %not11, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub12 = sub i32 0, %xor
  %shr13 = lshr i32 %sub12, 8
  %not14 = xor i32 %shr13, -1
  store i32 %not14, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor15 = xor i32 %8, 47
  %sub16 = sub i32 0, %xor15
  %shr17 = lshr i32 %sub16, 8
  %not18 = xor i32 %shr17, -1
  store i32 %not18, ptr %s, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub19 = sub i32 %10, 65
  %and = and i32 %9, %sub19
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub20 = sub i32 %12, 71
  %and21 = and i32 %11, %sub20
  %or22 = or i32 %and, %and21
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub23 = sub i32 %14, -4
  %and24 = and i32 %13, %sub23
  %or25 = or i32 %or22, %and24
  %15 = load i32, ptr %p, align 4
  %and26 = and i32 %15, 62
  %or27 = or i32 %or25, %and26
  %16 = load i32, ptr %s, align 4
  %and28 = and i32 %16, 63
  %or29 = or i32 %or27, %and28
  %and30 = and i32 %or29, 255
  store i32 %and30, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub31 = sub i32 0, %18
  %shr32 = lshr i32 %sub31, 8
  %not33 = xor i32 %shr32, -1
  %19 = load i32, ptr %u, align 4
  %xor34 = xor i32 %19, 65
  %sub35 = sub i32 0, %xor34
  %shr36 = lshr i32 %sub35, 8
  %and37 = and i32 %not33, %shr36
  %and38 = and i32 %and37, 255
  %or39 = or i32 %17, %and38
  ret i32 %or39
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
