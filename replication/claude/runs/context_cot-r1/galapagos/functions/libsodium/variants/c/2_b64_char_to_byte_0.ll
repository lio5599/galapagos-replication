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
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %not = xor i32 %sub, -1
  %shr = lshr i32 %not, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %not2 = xor i32 %sub1, -1
  %shr3 = lshr i32 %not2, 8
  %and = and i32 %shr, %shr3
  %3 = load i32, ptr %u, align 4
  %sub4 = sub i32 %3, 65
  %and5 = and i32 %and, %sub4
  %and6 = and i32 %and5, 255
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 %4, 97
  %not8 = xor i32 %sub7, -1
  %shr9 = lshr i32 %not8, 8
  %5 = load i32, ptr %u, align 4
  %sub10 = sub i32 122, %5
  %not11 = xor i32 %sub10, -1
  %shr12 = lshr i32 %not11, 8
  %and13 = and i32 %shr9, %shr12
  %6 = load i32, ptr %u, align 4
  %sub14 = sub i32 %6, 71
  %and15 = and i32 %and13, %sub14
  %and16 = and i32 %and15, 255
  %or = or i32 %and6, %and16
  %7 = load i32, ptr %u, align 4
  %sub17 = sub i32 %7, 48
  %not18 = xor i32 %sub17, -1
  %shr19 = lshr i32 %not18, 8
  %8 = load i32, ptr %u, align 4
  %sub20 = sub i32 57, %8
  %not21 = xor i32 %sub20, -1
  %shr22 = lshr i32 %not21, 8
  %and23 = and i32 %shr19, %shr22
  %9 = load i32, ptr %u, align 4
  %add = add i32 %9, 4
  %and24 = and i32 %and23, %add
  %and25 = and i32 %and24, 255
  %or26 = or i32 %or, %and25
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %sub27 = sub i32 0, %xor
  %not28 = xor i32 %sub27, -1
  %shr29 = lshr i32 %not28, 8
  %and30 = and i32 %shr29, 62
  %or31 = or i32 %or26, %and30
  %11 = load i32, ptr %u, align 4
  %xor32 = xor i32 %11, 47
  %sub33 = sub i32 0, %xor32
  %not34 = xor i32 %sub33, -1
  %shr35 = lshr i32 %not34, 8
  %and36 = and i32 %shr35, 63
  %or37 = or i32 %or31, %and36
  store i32 %or37, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %13 = load i32, ptr %x, align 4
  %sub38 = sub i32 0, %13
  %not39 = xor i32 %sub38, -1
  %shr40 = lshr i32 %not39, 8
  %14 = load i32, ptr %u, align 4
  %xor41 = xor i32 %14, 65
  %sub42 = sub i32 0, %xor41
  %shr43 = lshr i32 %sub42, 8
  %and44 = and i32 %shr40, %shr43
  %and45 = and i32 %and44, 255
  %or46 = or i32 %12, %and45
  ret i32 %or46
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
