; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_0.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_0.c"
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
  %up = alloca i32, align 4
  %lo = alloca i32, align 4
  %di = alloca i32, align 4
  %pl = alloca i32, align 4
  %sl = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %na = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  %and = and i32 %shr, 255
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %not2 = xor i32 %sub1, -1
  %shr3 = lshr i32 %not2, 8
  %and4 = and i32 %shr3, 255
  %and5 = and i32 %and, %and4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 65
  %and7 = and i32 %and5, %sub6
  store i32 %and7, ptr %up, align 4
  %4 = load i32, ptr %u, align 4
  %sub8 = sub i32 %4, 97
  %not9 = xor i32 %sub8, -1
  %shr10 = lshr i32 %not9, 8
  %and11 = and i32 %shr10, 255
  %5 = load i32, ptr %u, align 4
  %sub12 = sub i32 122, %5
  %not13 = xor i32 %sub12, -1
  %shr14 = lshr i32 %not13, 8
  %and15 = and i32 %shr14, 255
  %and16 = and i32 %and11, %and15
  %6 = load i32, ptr %u, align 4
  %sub17 = sub i32 %6, 71
  %and18 = and i32 %and16, %sub17
  store i32 %and18, ptr %lo, align 4
  %7 = load i32, ptr %u, align 4
  %sub19 = sub i32 %7, 48
  %not20 = xor i32 %sub19, -1
  %shr21 = lshr i32 %not20, 8
  %and22 = and i32 %shr21, 255
  %8 = load i32, ptr %u, align 4
  %sub23 = sub i32 57, %8
  %not24 = xor i32 %sub23, -1
  %shr25 = lshr i32 %not24, 8
  %and26 = and i32 %shr25, 255
  %and27 = and i32 %and22, %and26
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and28 = and i32 %and27, %add
  store i32 %and28, ptr %di, align 4
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub29 = sub i32 0, %xor
  %not30 = xor i32 %sub29, -1
  %shr31 = lshr i32 %not30, 8
  %and32 = and i32 %shr31, 255
  %and33 = and i32 %and32, 62
  store i32 %and33, ptr %pl, align 4
  %11 = load i32, ptr %u, align 4
  %xor34 = xor i32 %11, 47
  %sub35 = sub i32 0, %xor34
  %not36 = xor i32 %sub35, -1
  %shr37 = lshr i32 %not36, 8
  %and38 = and i32 %shr37, 255
  %and39 = and i32 %and38, 63
  store i32 %and39, ptr %sl, align 4
  %12 = load i32, ptr %up, align 4
  %13 = load i32, ptr %lo, align 4
  %or = or i32 %12, %13
  %14 = load i32, ptr %di, align 4
  %or40 = or i32 %or, %14
  %15 = load i32, ptr %pl, align 4
  %or41 = or i32 %or40, %15
  %16 = load i32, ptr %sl, align 4
  %or42 = or i32 %or41, %16
  store i32 %or42, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub43 = sub i32 0, %17
  %not44 = xor i32 %sub43, -1
  %shr45 = lshr i32 %not44, 8
  %and46 = and i32 %shr45, 255
  store i32 %and46, ptr %z, align 4
  %18 = load i32, ptr %u, align 4
  %xor47 = xor i32 %18, 65
  %sub48 = sub i32 0, %xor47
  %shr49 = lshr i32 %sub48, 8
  %and50 = and i32 %shr49, 255
  store i32 %and50, ptr %na, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %z, align 4
  %21 = load i32, ptr %na, align 4
  %and51 = and i32 %20, %21
  %or52 = or i32 %19, %and51
  ret i32 %or52
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
